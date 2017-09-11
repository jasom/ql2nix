
{ buildLispPackage, stdenv, fetchurl, lisp-project_clx-truetype, 
   lisp_cl-aa, lisp_cl-fad, lisp_cl-paths-ttf, lisp_cl-store, lisp_cl-vectors, lisp_clx, lisp_trivial-features, lisp_zpb-ttf,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-aa lisp_cl-fad lisp_cl-paths-ttf lisp_cl-store lisp_cl-vectors lisp_clx lisp_trivial-features lisp_zpb-ttf  ];
      inherit stdenv;
      systemName = "clx-truetype";
      
      sourceProject = "${lisp-project_clx-truetype}";
      patches = [];
      lisp_dependencies = "${lisp_cl-aa} ${lisp_cl-fad} ${lisp_cl-paths-ttf} ${lisp_cl-store} ${lisp_cl-vectors} ${lisp_clx} ${lisp_trivial-features} ${lisp_zpb-ttf}";
      name = "lisp_clx-truetype-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
