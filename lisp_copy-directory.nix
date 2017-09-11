
{ buildLispPackage, stdenv, fetchurl, lisp-project_copy-directory, 
   lisp_cl-fad, lisp_which,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad lisp_which  ];
      inherit stdenv;
      systemName = "copy-directory";
      
      sourceProject = "${lisp-project_copy-directory}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad} ${lisp_which}";
      name = "lisp_copy-directory-20160628-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
