
{ buildLispPackage, stdenv, fetchurl, lisp-project_gamebox-sprite-packer, 
   lisp_fs-utils, lisp_opticl, lisp_alexandria,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fs-utils lisp_opticl lisp_alexandria  ];
      inherit stdenv;
      systemName = "gamebox-sprite-packer";
      
      sourceProject = "${lisp-project_gamebox-sprite-packer}";
      patches = [];
      lisp_dependencies = "${lisp_fs-utils} ${lisp_opticl} ${lisp_alexandria}";
      name = "lisp_gamebox-sprite-packer-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
