
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-azure, 
   lisp_rt, lisp_cl-json, lisp_cxml, lisp_ironclad, lisp_drakma,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_rt lisp_cl-json lisp_cxml lisp_ironclad lisp_drakma  ];
      inherit stdenv;
      systemName = "cl-azure";
      
      sourceProject = "${lisp-project_cl-azure}";
      patches = [];
      lisp_dependencies = "${lisp_rt} ${lisp_cl-json} ${lisp_cxml} ${lisp_ironclad} ${lisp_drakma}";
      name = "lisp_cl-azure-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
