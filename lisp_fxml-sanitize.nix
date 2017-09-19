
{ buildLispPackage, stdenv, fetchurl, lisp-project_fxml, 
   lisp_flexi-streams, lisp_quri, lisp_trivial-gray-streams, lisp_babel, lisp_serapeum, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_flexi-streams lisp_quri lisp_trivial-gray-streams lisp_babel lisp_serapeum lisp_alexandria  ];
      inherit stdenv;
      systemName = "fxml/sanitize";
      
      sourceProject = "${lisp-project_fxml}";
      patches = [];
      lisp_dependencies = "${lisp_flexi-streams} ${lisp_quri} ${lisp_trivial-gray-streams} ${lisp_babel} ${lisp_serapeum} ${lisp_alexandria}";
      name = "lisp_fxml-sanitize-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
