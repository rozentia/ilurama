import React from 'react'
import { Box, Label, Checkbox } from 'theme-ui'

const FormCheckbox = ({ id, placeholder, ...props }) => (
  <Label htmlFor={id}>
    <Box
      sx={{ position: `relative`, mr: 1, input: { zIndex: `0 !important` } }}
    >
      <Checkbox
        sx={{
          'input:checked ~ &': {
            color: 'alpha'
          }
        }}
        {...props}
        value={undefined}
        checked={props.value}
      />
    </Box>
    {placeholder?.text}
  </Label>
)

export default FormCheckbox
