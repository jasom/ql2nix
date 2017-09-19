
{ buildLispPackage, stdenv, fetchurl, lisp-project_ahungry-fleece, 
   lisp_split-sequence, lisp_md5, lisp_cl-yaml, lisp_cl-json,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_split-sequence lisp_md5 lisp_cl-yaml lisp_cl-json  ];
      inherit stdenv;
      systemName = "ahungry-fleece";
      
      sourceProject = "${lisp-project_ahungry-fleece}";
      patches = [];
      lisp_dependencies = "${lisp_split-sequence} ${lisp_md5} ${lisp_cl-yaml} ${lisp_cl-json}";
      name = "lisp_ahungry-fleece-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
