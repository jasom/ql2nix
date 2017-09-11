
{ buildLispPackage, stdenv, fetchurl, lisp-project_nst, 
   lisp_closer-mop, lisp_org-sampler,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_org-sampler  ];
      inherit stdenv;
      systemName = "nst";
      
      sourceProject = "${lisp-project_nst}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_org-sampler}";
      name = "lisp_nst-4.1.0";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
