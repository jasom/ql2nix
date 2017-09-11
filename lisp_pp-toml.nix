
{ buildLispPackage, stdenv, fetchurl, lisp-project_pp-toml, 
   lisp_alexandria, lisp_cl-ppcre, lisp_esrap, lisp_generic-comparability, lisp_local-time, lisp_parse-number, lisp_split-sequence,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-ppcre lisp_esrap lisp_generic-comparability lisp_local-time lisp_parse-number lisp_split-sequence  ];
      inherit stdenv;
      systemName = "pp-toml";
      
      sourceProject = "${lisp-project_pp-toml}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-ppcre} ${lisp_esrap} ${lisp_generic-comparability} ${lisp_local-time} ${lisp_parse-number} ${lisp_split-sequence}";
      name = "lisp_pp-toml-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
