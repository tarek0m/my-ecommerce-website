/**
 * Transforms flat attribute list into a grouped structure by attribute_set_name
 * @param {Array} attributes - The flat array of attribute objects
 * @returns {Array} - Grouped attributes with items arrays
 */
export const transformAttributes = (attributes) => {
  // Use a Map to collect attributes with the same set name
  const attributeMap = new Map();

  // Group attributes by attribute_set_name
  attributes.forEach((attr) => {
    const { attribute_set_name, display_value, value, attributeId } = attr;

    if (!attributeMap.has(attribute_set_name)) {
      attributeMap.set(attribute_set_name, {
        id: attribute_set_name,
        name: attribute_set_name,
        items: [],
      });
    }

    // Add the item to the appropriate attribute group
    attributeMap.get(attribute_set_name).items.push({
      displayValue: display_value,
      value: value,
      id: attributeId,
    });
  });

  console.log(attributeMap);

  // Convert Map to array
  return Array.from(attributeMap.values());
};
