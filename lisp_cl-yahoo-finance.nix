
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-yahoo-finance, 
   lisp_url-rewrite, lisp_yason, lisp_cl-csv, lisp_drakma,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_url-rewrite lisp_yason lisp_cl-csv lisp_drakma  ];
      inherit stdenv;
      systemName = "cl-yahoo-finance";
      
      sourceProject = "${lisp-project_cl-yahoo-finance}";
      patches = [];
      lisp_dependencies = "${lisp_url-rewrite} ${lisp_yason} ${lisp_cl-csv} ${lisp_drakma}";
      name = "lisp_cl-yahoo-finance-20130312-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
