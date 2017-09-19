
{ buildLispPackage, stdenv, fetchurl, lisp-project_fmt, 
   lisp_local-time, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_local-time lisp_alexandria  ];
      inherit stdenv;
      systemName = "fmt-time";
      
      sourceProject = "${lisp-project_fmt}";
      patches = [];
      lisp_dependencies = "${lisp_local-time} ${lisp_alexandria}";
      name = "lisp_fmt-time-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
