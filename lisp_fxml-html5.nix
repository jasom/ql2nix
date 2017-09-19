
{ buildLispPackage, stdenv, fetchurl, lisp-project_fxml, 
   lisp_cl-html5-parser, lisp_xpath, lisp_flexi-streams, lisp_quri, lisp_trivial-gray-streams, lisp_babel, lisp_fset, lisp_serapeum, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-html5-parser lisp_xpath lisp_flexi-streams lisp_quri lisp_trivial-gray-streams lisp_babel lisp_fset lisp_serapeum lisp_alexandria  ];
      inherit stdenv;
      systemName = "fxml/html5";
      
      sourceProject = "${lisp-project_fxml}";
      patches = [];
      lisp_dependencies = "${lisp_cl-html5-parser} ${lisp_xpath} ${lisp_flexi-streams} ${lisp_quri} ${lisp_trivial-gray-streams} ${lisp_babel} ${lisp_fset} ${lisp_serapeum} ${lisp_alexandria}";
      name = "lisp_fxml-html5-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
