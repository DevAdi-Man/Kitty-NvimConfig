# Comment Shortcuts for React Native Development

## Default Comment.nvim shortcuts:
- `gcc` - Toggle single line comment
- `gbc` - Toggle block comment
- `gc` (in visual mode) - Toggle comment for selection
- `gb` (in visual mode) - Toggle block comment for selection

## Custom shortcuts (no conflicts):
- `<leader>cc` - Toggle line comment (same as gcc)
- `<leader>cb` - Toggle block comment (same as gbc)
- `<leader>cc` (in visual mode) - Toggle comment selection
- `<leader>cb` (in visual mode) - Toggle block comment selection

## React Native/JSX specific shortcuts:
- `<leader>cj` - Toggle JSX comment style `{/* */}`
- `<leader>cs` - Switch between JS (`//`) and JSX (`{/* */}`) comment styles

## How it works in React Native/TSX files:

### JavaScript/TypeScript code (default):
```typescript
const name = "John"; // This will use // comment
```

### JSX/TSX elements (manual switch):
```jsx
<View>
  {/* This will use JSX comment style */}
  <Text>Hello World</Text>
</View>
```

## Usage Examples:

### For JavaScript code:
1. Place cursor on line
2. Press `gcc` or `<leader>cc` → Uses `// comment`

### For JSX elements:
1. Place cursor on JSX line
2. Press `<leader>cj` → Uses `{/* comment */}`

### Switch comment style:
1. In `.jsx` or `.tsx` file
2. Press `<leader>cs` to switch between `//` and `{/* */}`
3. Then use `gcc` with the new style

## Leader key: `<space>`
So `<leader>cc` means: `<space>cc`

## Quick Reference:
- `<space>cc` - Normal comment
- `<space>cj` - JSX comment  
- `<space>cs` - Switch style
- `gcc` - Quick comment (uses current style)
