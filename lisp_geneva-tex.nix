
{ buildLispPackage, stdenv, fetchurl, lisp-project_geneva, 
   lisp_file-types, lisp_geneva, lisp_named-readtables, lisp_texp,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_file-types lisp_geneva lisp_named-readtables lisp_texp  ];
      inherit stdenv;
      systemName = "geneva-tex";
      
      sourceProject = "${lisp-project_geneva}";
      patches = [];
      lisp_dependencies = "${lisp_file-types} ${lisp_geneva} ${lisp_named-readtables} ${lisp_texp}";
      name = "lisp_geneva-tex-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
