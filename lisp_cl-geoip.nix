
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-geoip, 
  geoip,   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi geoip ];
      inherit stdenv;
      systemName = "cl-geoip";
      
      sourceProject = "${lisp-project_cl-geoip}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_cl-geoip-20130615-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
