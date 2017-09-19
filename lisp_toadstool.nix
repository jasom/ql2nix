
{ buildLispPackage, stdenv, fetchurl, lisp-project_toadstool, 
   lisp_hu-dwim-walker, lisp_closer-mop,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-walker lisp_closer-mop  ];
      inherit stdenv;
      systemName = "toadstool";
      
      sourceProject = "${lisp-project_toadstool}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-walker} ${lisp_closer-mop}";
      name = "lisp_toadstool-20130615-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
