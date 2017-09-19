
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-singleton-mixin, 
   lisp_metap, lisp_closer-mop,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_metap lisp_closer-mop  ];
      inherit stdenv;
      systemName = "cl-singleton-mixin";
      
      sourceProject = "${lisp-project_cl-singleton-mixin}";
      patches = [];
      lisp_dependencies = "${lisp_metap} ${lisp_closer-mop}";
      name = "lisp_cl-singleton-mixin-20150505-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
