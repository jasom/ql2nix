
{ buildLispPackage, stdenv, fetchurl, lisp-project_geneva, 
   lisp_geneva, lisp_geneva-mk2,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_geneva lisp_geneva-mk2  ];
      inherit stdenv;
      systemName = "geneva-plain-text";
      
      sourceProject = "${lisp-project_geneva}";
      patches = [];
      lisp_dependencies = "${lisp_geneva} ${lisp_geneva-mk2}";
      name = "lisp_geneva-plain-text-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
