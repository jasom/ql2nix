
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-rfc2047, 
   lisp_babel, lisp_cl-base64,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_cl-base64  ];
      inherit stdenv;
      systemName = "cl-rfc2047";
      
      sourceProject = "${lisp-project_cl-rfc2047}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_cl-base64}";
      name = "lisp_cl-rfc2047-20150804-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
