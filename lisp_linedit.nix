
{ buildLispPackage, stdenv, fetchurl, lisp-project_linedit, 
   lisp_osicat, lisp_uffi, lisp_madeira-port,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_osicat lisp_uffi lisp_madeira-port  ];
      inherit stdenv;
      systemName = "linedit";
      
      sourceProject = "${lisp-project_linedit}";
      patches = [];
      lisp_dependencies = "${lisp_osicat} ${lisp_uffi} ${lisp_madeira-port}";
      name = "lisp_linedit-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
