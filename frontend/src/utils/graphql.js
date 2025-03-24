// const GRAPHQL_ENDPOINT = 'http://localhost:8000/graphql';

// for production
const GRAPHQL_ENDPOINT = '/graphql';

async function graphqlRequest(query, variables = {}) {
  try {
    const response = await fetch(GRAPHQL_ENDPOINT, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        query,
        variables,
      }),
    });

    const data = await response.json();

    if (data.errors) {
      throw new Error(data.errors[0].message);
    }

    return data.data;
  } catch (error) {
    console.error('GraphQL Error:', error);
    throw error;
  }
}

// Query fragments
const PRODUCT_FRAGMENT = `
  fragment ProductFields on Product {
    id
    name
    description
    category_id
    inStock
    brand
    price
    currency
    gallery
    attributes {
      attribute_set_name
      display_value
      value
      attributeId
    }
  }
`;

// Queries
export const GET_PRODUCTS = `
  ${PRODUCT_FRAGMENT}
  query GetProducts {
    products {
      ...ProductFields
    }
  }
`;

export const GET_CATEGORIES = `
  query GetCategories {
    categories {
      id
      name
    }
  }
`;

export default graphqlRequest;
