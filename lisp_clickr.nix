
{ buildLispPackage, stdenv, fetchurl, lisp-project_clickr, 
   lisp_cl-ppcre, lisp_md5, lisp_s-xml, lisp_s-xml-rpc, lisp_trivial-http,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_md5 lisp_s-xml lisp_s-xml-rpc lisp_trivial-http  ];
      inherit stdenv;
      systemName = "clickr";
      
      sourceProject = "${lisp-project_clickr}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_md5} ${lisp_s-xml} ${lisp_s-xml-rpc} ${lisp_trivial-http}";
      name = "lisp_clickr-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
