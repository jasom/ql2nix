
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-rss, 
   lisp_aserve, lisp_kmrcl, lisp_xmls,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_aserve lisp_kmrcl lisp_xmls  ];
      inherit stdenv;
      systemName = "rss";
      
      sourceProject = "${lisp-project_cl-rss}";
      patches = [];
      lisp_dependencies = "${lisp_aserve} ${lisp_kmrcl} ${lisp_xmls}";
      name = "lisp_rss-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
