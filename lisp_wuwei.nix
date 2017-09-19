
{ buildLispPackage, stdenv, fetchurl, lisp-project_wuwei, 
   lisp_drakma, lisp_mtlisp, lisp_cl-json, lisp_aserve,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_drakma lisp_mtlisp lisp_cl-json lisp_aserve  ];
      inherit stdenv;
      systemName = "wuwei";
      
      sourceProject = "${lisp-project_wuwei}";
      patches = [];
      lisp_dependencies = "${lisp_drakma} ${lisp_mtlisp} ${lisp_cl-json} ${lisp_aserve}";
      name = "lisp_wuwei-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
