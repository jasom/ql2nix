
{ buildLispPackage, stdenv, fetchurl, lisp-project_plokami, 
  libpcap,   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi libpcap ];
      inherit stdenv;
      systemName = "plokami";
      
      sourceProject = "${lisp-project_plokami}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_plokami-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
