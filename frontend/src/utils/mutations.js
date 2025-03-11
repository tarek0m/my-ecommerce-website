// Order mutations
export const CREATE_ORDER = `
  mutation CreateOrder($items: String!) {
    createOrder(items: $items) {
      id
      order_date
      total_amount
      items
    }
  }
`;
