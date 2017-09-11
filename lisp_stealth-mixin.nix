
{ buildLispPackage, stdenv, fetchurl, lisp-project_stealth-mixin, 
   lisp_closer-mop,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop  ];
      inherit stdenv;
      systemName = "stealth-mixin";
      
      sourceProject = "${lisp-project_stealth-mixin}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop}";
      name = "lisp_stealth-mixin-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
