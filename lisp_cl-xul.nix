
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-xul, 
   lisp_md5, lisp_cl-json, lisp_clws, lisp_closer-mop, lisp_cxml, lisp_parenscript, lisp_cl-fad, lisp_log5, lisp_alexandria,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_md5 lisp_cl-json lisp_clws lisp_closer-mop lisp_cxml lisp_parenscript lisp_cl-fad lisp_log5 lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-xul";
      
      sourceProject = "${lisp-project_cl-xul}";
      patches = [];
      lisp_dependencies = "${lisp_md5} ${lisp_cl-json} ${lisp_clws} ${lisp_closer-mop} ${lisp_cxml} ${lisp_parenscript} ${lisp_cl-fad} ${lisp_log5} ${lisp_alexandria}";
      name = "lisp_cl-xul-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
