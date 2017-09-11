
{ buildLispPackage, stdenv, fetchurl, lisp-project_kl-verify, 
   lisp_image,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_image  ];
      inherit stdenv;
      systemName = "kl-verify";
      
      sourceProject = "${lisp-project_kl-verify}";
      patches = [];
      lisp_dependencies = "${lisp_image}";
      name = "lisp_kl-verify-20120909-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
