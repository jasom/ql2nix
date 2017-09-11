
{ buildLispPackage, stdenv, fetchurl, lisp-project_org-sampler, 
   lisp_iterate,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate  ];
      inherit stdenv;
      systemName = "org-sampler";
      
      sourceProject = "${lisp-project_org-sampler}";
      patches = [];
      lisp_dependencies = "${lisp_iterate}";
      name = "lisp_org-sampler-0.2.0";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
