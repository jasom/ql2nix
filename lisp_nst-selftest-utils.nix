
{ buildLispPackage, stdenv, fetchurl, lisp-project_nst, 
   lisp_org-sampler, lisp_closer-mop,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_org-sampler lisp_closer-mop  ];
      inherit stdenv;
      systemName = "nst-selftest-utils";
      
      sourceProject = "${lisp-project_nst}";
      patches = [];
      lisp_dependencies = "${lisp_org-sampler} ${lisp_closer-mop}";
      name = "lisp_nst-selftest-utils-4.1.0";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
