
{ buildLispPackage, stdenv, fetchurl, lisp-project_tbnl, 
   lisp_cl-base64, lisp_cl-ppcre, lisp_kmrcl, lisp_md5, lisp_rfc2388, lisp_url-rewrite,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-base64 lisp_cl-ppcre lisp_kmrcl lisp_md5 lisp_rfc2388 lisp_url-rewrite  ];
      inherit stdenv;
      systemName = "tbnl";
      
      sourceProject = "${lisp-project_tbnl}";
      patches = [];
      lisp_dependencies = "${lisp_cl-base64} ${lisp_cl-ppcre} ${lisp_kmrcl} ${lisp_md5} ${lisp_rfc2388} ${lisp_url-rewrite}";
      name = "lisp_tbnl-0.11.4";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
