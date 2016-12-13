const color = {
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
  _black: "#263238",
  _red: "#d32f2f",
  _green: "#388e3c",
  _yellow: "#f9a825",
  _blue: "#1976d2",
  _magenta: "#512da8",

  _white: "#eff1f5",
}


const old = `
  .header_header {
    top: 0;
    right: 0;
    left: 0;
  }

  .tabs_title {
    color: #6d8794;
  }
  .tab_textActive {
    color: #6d8794;
    font-weight: bold;
  }
  .tab_active:before {
    border-color: rgba(106, 168, 230, 0.6);
  }
  .tab_tab.tab_hasActivity {
    color: #4078f2 !important;
  }
  .splitpane_divider {
    background-color: rgb(211, 215, 220) !important;
  }
`


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
    color: ${ color.white } !important;
    border-color: #ccc !important;
  }
  .tab_tab.tab_active {
    font-weight: 500;
    background-color: ${ color.background};
    border-color: rgba(0, 0, 0, .25) !important;
  }
  .tab_tab.tab_active::before {
    border-bottom-color: ${ color.background};
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
    color: ${ color._black } !important;
  }
  .tab_tab.tab_hasActivity {
    color: ${ color.blue } !important;
  }
`

const termCSS = `
  x-screen {
    overflow-y: hidden !important;
  }

  .cursor-node {
    opacity: .4;
  }
`


module.exports = {
  plugins: [
    'hyper-blink',
    'hypercwd',
    // 'hyperterm-tab-icons',
  ],
  config: {
    fontSize: 12,
    fontFamily: '"Source Code Pro", Menlo, monospace',
    padding: '.25em',
    shell: '/usr/local/bin/zsh',

    css, // main window
    termCSS, // terminal window

    colors: [
      color.black,
      color.red,
      color.green,
      color.yellow,
      color.blue,
      color.magenta,
      color.cyan,
      color.white,
      color._black,
      color._red,
      color._green,
      color._yellow,
      color._blue,
      color._magenta,
      color._cyan,
      color._white,
    ],

    foregroundColor: color.foreground,
    backgroundColor: color.background,
    cursorColor: color.cursor,
    borderColor: color.background,
  }
}