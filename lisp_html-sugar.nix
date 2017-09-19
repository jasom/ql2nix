
{ buildLispPackage, stdenv, fetchurl, lisp-project_html-sugar, 
   lisp_uffi, lisp_sclf, lisp_aserve,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_uffi lisp_sclf lisp_aserve  ];
      inherit stdenv;
      systemName = "html-sugar";
      
      sourceProject = "${lisp-project_html-sugar}";
      patches = [];
      lisp_dependencies = "${lisp_uffi} ${lisp_sclf} ${lisp_aserve}";
      name = "lisp_html-sugar-20110829-http";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
