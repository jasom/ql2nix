
{ buildLispPackage, stdenv, fetchurl, lisp-project_pp-toml, 
   lisp_esrap, lisp_split-sequence, lisp_parse-number, lisp_local-time, lisp_generic-comparability, lisp_cl-ppcre, lisp_alexandria,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_esrap lisp_split-sequence lisp_parse-number lisp_local-time lisp_generic-comparability lisp_cl-ppcre lisp_alexandria  ];
      inherit stdenv;
      systemName = "pp-toml";
      
      sourceProject = "${lisp-project_pp-toml}";
      patches = [];
      lisp_dependencies = "${lisp_esrap} ${lisp_split-sequence} ${lisp_parse-number} ${lisp_local-time} ${lisp_generic-comparability} ${lisp_cl-ppcre} ${lisp_alexandria}";
      name = "lisp_pp-toml-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
