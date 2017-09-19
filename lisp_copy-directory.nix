
{ buildLispPackage, stdenv, fetchurl, lisp-project_copy-directory, 
   lisp_which, lisp_cl-fad,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_which lisp_cl-fad  ];
      inherit stdenv;
      systemName = "copy-directory";
      
      sourceProject = "${lisp-project_copy-directory}";
      patches = [];
      lisp_dependencies = "${lisp_which} ${lisp_cl-fad}";
      name = "lisp_copy-directory-20160628-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
