
{ buildLispPackage, stdenv, fetchurl, lisp-project_ext-blog, 
   lisp_s-xml-rpc, lisp_restas-file-publisher, lisp_kl-verify, lisp_local-time, lisp_closure-template, lisp_cl-store, lisp_restas,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_s-xml-rpc lisp_restas-file-publisher lisp_kl-verify lisp_local-time lisp_closure-template lisp_cl-store lisp_restas  ];
      inherit stdenv;
      systemName = "ext-blog";
      
      sourceProject = "${lisp-project_ext-blog}";
      patches = [];
      lisp_dependencies = "${lisp_s-xml-rpc} ${lisp_restas-file-publisher} ${lisp_kl-verify} ${lisp_local-time} ${lisp_closure-template} ${lisp_cl-store} ${lisp_restas}";
      name = "lisp_ext-blog-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
