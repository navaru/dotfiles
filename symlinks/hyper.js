const shell = '/usr/local/bin/zsh'

const colors = {
  cursor: '#23b4fd',
  background: '#fafafa',
  foreground: '#101010',

  // normal
  black: "#263238",
  red: "#d32f2f",
  green: "#388e3c",
  yellow: "#f9a825",
  blue: "#1976d2",
  magenta: "#512da8",
  cyan: "#0097a7",
  white: "#c0c5ce",

  // light
  lightBlack: "#263238",
  lightRed: "#d32f2f",
  lightGreen: "#388e3c",
  lightYellow: "#f9a825",
  lightBlue: "#1976d2",
  lightMagenta: "#512da8",
  lightWhite: "#eff1f5",
}


const termCSS = ``


const css = `
  .header_header {
    top: 0;
    right: 0;
    left: 0;
  }
  .tabs_list,
  .splitpane_divider {
    background-color: #e5e5e6 !important;
  }
  .tabs_list {
    margin-left: 0 !important;
    padding-left: 76px;
  }
  .tabs_list::before {
    content: "";
    position: absolute;
    z-index: 2;
    left: 0;
    bottom: 0;
    width: 76px;
    height: 1px;
    background-color: #ccc;
  }
  .tab_tab {
    color: ${ colors.white } !important;
    border-color: #ccc !important;
  }
  .tab_tab.tab_active {
    font-weight: 500;
    background-color: ${ colors.background};
    border-color: rgba(0, 0, 0, .25) !important;
  }
  .tab_tab.tab_active::before {
    border-bottom-color: ${ colors.background};
  }
  .tab_tab::after {
    content: "";
    position: absolute;
    pointer-events: none;
    z-index: 2;
    top: 0px;
    left: -1px;
    bottom: 0;
    width: 2px;
    border-radius: 0;
    background-color: #475fd7;
    opacity: 0;
    transition: opacity .16s;
  }
  .tab_tab.tab_active::after {
    opacity: 1;
    transition-duration: .32s;
  }
  .tabs_title, .tab_icon, .tab_tab.tab_active {
    color: ${ colors.lightBlack } !important;
  }
  .tab_tab.tab_hasActivity {
    color: ${ colors.blue } !important;
  }
`



module.exports = {
  plugins: [
    'hypercwd',
  ],

  config: {
    css,
    termCSS,
    shell,
    colors,

    fontSize: 13,
    fontFamily: '"Source Code Pro", Menlo, monospace',
    padding: '.25em',

    foregroundColor: colors.foreground,
    backgroundColor: colors.background,
    cursorColor: colors.cursor,
    borderColor: colors.background,
  }
}
