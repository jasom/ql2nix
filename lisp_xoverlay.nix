
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-libxml2, 
   lisp_cl-libxml2,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-libxml2  ];
      inherit stdenv;
      systemName = "xoverlay";
      
      sourceProject = "${lisp-project_cl-libxml2}";
      patches = [];
      lisp_dependencies = "${lisp_cl-libxml2}";
      name = "lisp_xoverlay-20130615-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
