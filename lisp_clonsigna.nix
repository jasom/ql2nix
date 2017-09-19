
{ buildLispPackage, stdenv, fetchurl, lisp-project_clonsigna, 
   lisp_cl-ssl, lisp_cl-ppcre, lisp_cl-base64, lisp_iolib,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ssl lisp_cl-ppcre lisp_cl-base64 lisp_iolib  ];
      inherit stdenv;
      systemName = "clonsigna";
      
      sourceProject = "${lisp-project_clonsigna}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ssl} ${lisp_cl-ppcre} ${lisp_cl-base64} ${lisp_iolib}";
      name = "lisp_clonsigna-20120909-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
