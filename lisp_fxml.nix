
{ buildLispPackage, stdenv, fetchurl, lisp-project_fxml, 
   lisp_fxml-runes, lisp_fxml-xml,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fxml-runes lisp_fxml-xml  ];
      inherit stdenv;
      systemName = "fxml";
      
      sourceProject = "${lisp-project_fxml}";
      patches = [];
      lisp_dependencies = "${lisp_fxml-runes} ${lisp_fxml-xml}";
      name = "lisp_fxml-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
