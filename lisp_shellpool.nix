
{ buildLispPackage, stdenv, fetchurl, lisp-project_shellpool, 
   lisp_bordeaux-threads, lisp_bt-semaphore, lisp_cl-fad, lisp_trivial-features,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_bt-semaphore lisp_cl-fad lisp_trivial-features  ];
      inherit stdenv;
      systemName = "shellpool";
      
      sourceProject = "${lisp-project_shellpool}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_bt-semaphore} ${lisp_cl-fad} ${lisp_trivial-features}";
      name = "lisp_shellpool-20150505-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
