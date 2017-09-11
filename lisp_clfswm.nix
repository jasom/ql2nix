
{ buildLispPackage, stdenv, fetchurl, lisp-project_clfswm, 
   lisp_clx,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clx  ];
      inherit stdenv;
      systemName = "clfswm";
      
      sourceProject = "${lisp-project_clfswm}";
      patches = [];
      lisp_dependencies = "${lisp_clx}";
      name = "lisp_clfswm-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
