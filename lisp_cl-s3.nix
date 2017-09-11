
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-s3, 
   lisp_ironclad, lisp_s-base64, lisp_s-http-client, lisp_s-utils, lisp_s-xml,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ironclad lisp_s-base64 lisp_s-http-client lisp_s-utils lisp_s-xml  ];
      inherit stdenv;
      systemName = "cl-s3";
      
      sourceProject = "${lisp-project_cl-s3}";
      patches = [];
      lisp_dependencies = "${lisp_ironclad} ${lisp_s-base64} ${lisp_s-http-client} ${lisp_s-utils} ${lisp_s-xml}";
      name = "lisp_cl-s3-20130128-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
