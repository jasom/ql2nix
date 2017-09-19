
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-sam, 
   lisp_deoxybyte-gzip, lisp_deoxybyte-systems,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_deoxybyte-gzip lisp_deoxybyte-systems  ];
      inherit stdenv;
      systemName = "cl-sam";
      
      sourceProject = "${lisp-project_cl-sam}";
      patches = [];
      lisp_dependencies = "${lisp_deoxybyte-gzip} ${lisp_deoxybyte-systems}";
      name = "lisp_cl-sam-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
