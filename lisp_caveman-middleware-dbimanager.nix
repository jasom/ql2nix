
{ buildLispPackage, stdenv, fetchurl, lisp-project_caveman, 
   lisp_dbi, lisp_clack-v1-compat,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_dbi lisp_clack-v1-compat  ];
      inherit stdenv;
      systemName = "caveman-middleware-dbimanager";
      
      sourceProject = "${lisp-project_caveman}";
      patches = [];
      lisp_dependencies = "${lisp_dbi} ${lisp_clack-v1-compat}";
      name = "lisp_caveman-middleware-dbimanager-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
