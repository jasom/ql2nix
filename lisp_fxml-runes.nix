
{ buildLispPackage, stdenv, fetchurl, lisp-project_fxml, 
   lisp_babel, lisp_named-readtables, lisp_trivial-gray-streams,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_named-readtables lisp_trivial-gray-streams  ];
      inherit stdenv;
      systemName = "fxml/runes";
      
      sourceProject = "${lisp-project_fxml}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_named-readtables} ${lisp_trivial-gray-streams}";
      name = "lisp_fxml-runes-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
