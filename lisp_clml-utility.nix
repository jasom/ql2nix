
{ buildLispPackage, stdenv, fetchurl, lisp-project_clml, 
   lisp_alexandria, lisp_parse-number, lisp_cl-ppcre, lisp_iterate, lisp_cl-fad, lisp_drakma,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_parse-number lisp_cl-ppcre lisp_iterate lisp_cl-fad lisp_drakma  ];
      inherit stdenv;
      systemName = "clml.utility";
      
      sourceProject = "${lisp-project_clml}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_parse-number} ${lisp_cl-ppcre} ${lisp_iterate} ${lisp_cl-fad} ${lisp_drakma}";
      name = "lisp_clml-utility-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
