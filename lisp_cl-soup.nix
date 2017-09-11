
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-webkit, 
  gnome2,   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi gnome2.libsoup ];
      inherit stdenv;
      systemName = "cl-soup";
      
      sourceProject = "${lisp-project_cl-webkit}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_cl-soup-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
