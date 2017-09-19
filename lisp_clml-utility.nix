
{ buildLispPackage, stdenv, fetchurl, lisp-project_clml, 
   lisp_drakma, lisp_cl-fad, lisp_iterate, lisp_cl-ppcre, lisp_parse-number, lisp_alexandria,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_drakma lisp_cl-fad lisp_iterate lisp_cl-ppcre lisp_parse-number lisp_alexandria  ];
      inherit stdenv;
      systemName = "clml.utility";
      
      sourceProject = "${lisp-project_clml}";
      patches = [];
      lisp_dependencies = "${lisp_drakma} ${lisp_cl-fad} ${lisp_iterate} ${lisp_cl-ppcre} ${lisp_parse-number} ${lisp_alexandria}";
      name = "lisp_clml-utility-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
