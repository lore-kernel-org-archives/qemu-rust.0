Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1F4EFD23A
	for <qemu-rust@archiver.kernel.org>; Wed, 25 Feb 2026 09:51:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vvBY0-0006dx-43; Wed, 25 Feb 2026 04:51:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1vvBXw-0006aX-Et
 for qemu-rust@nongnu.org; Wed, 25 Feb 2026 04:51:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1vvBXt-000820-1i
 for qemu-rust@nongnu.org; Wed, 25 Feb 2026 04:51:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772013062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9wJ7Q5ozNJIParZdsQRU0qsIIxlByKZB0J4M1PT148A=;
 b=HWTrBCj1DnrktjznNRphPYvYF6BO9CSwRYDFGCrRiRaEK7nm/zoWwqjcwj1kroBgxlM1If
 j1kPgtPvN0Ohto5tskQUR7S2nyed1k9g3RPuaLD6PuaA+q3p1mz9TStQvPSnbYPTvRqsUa
 pvuxrtwp16pjWivE9nl4JHRFazcI7Ik=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-dHRMRVX9M-ywF4iC3SxHQg-1; Wed, 25 Feb 2026 04:49:43 -0500
X-MC-Unique: dHRMRVX9M-ywF4iC3SxHQg-1
X-Mimecast-MFC-AGG-ID: dHRMRVX9M-ywF4iC3SxHQg_1772012982
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-4376761037bso668819f8f.1
 for <qemu-rust@nongnu.org>; Wed, 25 Feb 2026 01:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1772012982; x=1772617782; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9wJ7Q5ozNJIParZdsQRU0qsIIxlByKZB0J4M1PT148A=;
 b=XcgQh8VjIOOF8NQgu2Pml5+a+KzYi5hWXWsH1mess6Y8P6AdSuODWOC8nqO50TV1Hk
 27QTINUbxOnACVXjz9sPqLLmy7STS20dk+1fLxZRtVQ1AbmdA+MnQPSqFd72Qt9Qxbi0
 LGmGN9oFWNEnnAT440fgh9S8sKX7IEEIERdjSUEyIHFr91xQAwrjIaU9DuDUtmVqRxOm
 o/pIDyYIQPu19wRx1slfsUzmP5DdO+BK7QaXMkgM4WwrVXxRBawj5M6uT7Ignc+iJh92
 DS4gC+rbyzCpbbDGJavBItOht0M6pzXzGFfFZBvsZnXHAt+cOBaDEEkdr1SMnJ1LVIss
 xutg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772012982; x=1772617782;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9wJ7Q5ozNJIParZdsQRU0qsIIxlByKZB0J4M1PT148A=;
 b=AWpupwjDSrigm3b6y3I+DOe29VEYPBLs4rXBblr/AB6rCJtqOsydwIM0+juyhlZtjr
 knOpauARMLnxZWUBgKUAl0C0iuit8Nu34IqqpbKCRZVTCdP6qniF9kNqCf+WfiPWCvaX
 IXqp0SQjxnhWoA8M5fmN8zi+xmWHBABAyxhXYfEA59tu6ogabgDK/NbPXjSAwlzuJv/n
 jbogFUmviWDiw7u2w31/Ia6/4U6Kc3bIcgHeul2j1eb1WEWxz7U4Aza9no04W37aSic0
 ldZ5+YOiLpmFxqetv4CwLPFv3FAUka33dTycSPXBQmZ0cy1py6YDxGCon9OGAUJTBgVH
 HlJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKshFpaIO6YF/0rtihoukjU8ZILkukSHgWyRQm0pGQDxNrqCWdI90TWE1V04mlloph1hHfgbNiKEg=@nongnu.org
X-Gm-Message-State: AOJu0Yx0izEgTN8fuOUtB6t62X8nzwPxEhB70/tZOFfrkyzSvZ+c2jep
 Q03ND/6CStvF9NpOw9u7wp+UfhTuhxo0wcX6dvBMzO8pVLQmys4LkOB+bavI2v4ym3w/ex76pGu
 ob0AMBcJz2ANYCWm4ZfnPK8edbMyUvZLO4sBTEx9tG+cN0cflab/qIeM=
X-Gm-Gg: ATEYQzxWalEbUS4OW5wl1E6AITA65iMcEjyJUSHR8HEkll7rRj/nXrdT0Tkw6LW+fPv
 eJMOQ5C1jvg78VdCzhGUhjhfdKovtquCQll51WalGC7l2DafH8JPc6Vfi3zqssL2SvBVPsARZ1l
 ACP6mSVg68DYP82sZyaQp92/UZiyIgK/EvfpAKPv+9nen11VDSSckwt2R5QRqN7Wuxy/wdV71ox
 hb5jr5jPXsJsMNO2DoOXNKBzy1rYR2I+4BNWKSycKBTK7PzeL2tceZpVAUO7h7LcQVYc/F/9cXi
 nJ6U/5n2PvmC2EiZz64e5keJ2qYO8hvBXLVIgg7e9/jQLhmfKtWA1TokMFn5Z6+cM1X14geq1nl
 DkI1Zo9Uc+lw13bNo538z+g==
X-Received: by 2002:a5d:5f86:0:b0:439:909f:c5a3 with SMTP id
 ffacd0b85a97d-439909fc8acmr2209261f8f.4.1772012982143; 
 Wed, 25 Feb 2026 01:49:42 -0800 (PST)
X-Received: by 2002:a5d:5f86:0:b0:439:909f:c5a3 with SMTP id
 ffacd0b85a97d-439909fc8acmr2209221f8f.4.1772012981677; 
 Wed, 25 Feb 2026 01:49:41 -0800 (PST)
Received: from wheatley.localdomain ([213.175.46.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970c09897sm33914924f8f.17.2026.02.25.01.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 01:49:40 -0800 (PST)
Received: by wheatley.localdomain (Postfix, from userid 1000)
 id 7C3C9194702D9; Wed, 25 Feb 2026 10:49:40 +0100 (CET)
Date: Wed, 25 Feb 2026 10:49:40 +0100
From: Martin Kletzander <mkletzan@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: Re: [PATCH v2 1/1] rust: use checked_div to make clippy happy
Message-ID: <aZ7FtAUfAJ0-y0qT@wheatley.k8r.cz>
References: <20260219185409.708130-1-jsnow@redhat.com>
 <20260219185409.708130-2-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9Ib26oYEF+J5DSKt"
Content-Disposition: inline
In-Reply-To: <20260219185409.708130-2-jsnow@redhat.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mkletzan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.358, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.659,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org


--9Ib26oYEF+J5DSKt
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 19, 2026 at 01:54:09PM -0500, John Snow wrote:
>When upgrading from Fedora 41 to Fedora 43 for CI tests, clippy begins
>complaining about not using checked_div instead of manually checking
>divisors. Make clippy happy and use checked_div() instead.
>
>Signed-off-by: John Snow <jsnow@redhat.com>
>---
> rust/hw/core/src/qdev.rs | 14 ++++++--------
> 1 file changed, 6 insertions(+), 8 deletions(-)
>
>diff --git a/rust/hw/core/src/qdev.rs b/rust/hw/core/src/qdev.rs
>index 145e20a984f..b2e5441079d 100644
>--- a/rust/hw/core/src/qdev.rs
>+++ b/rust/hw/core/src/qdev.rs
>@@ -425,18 +425,16 @@ pub const fn period_from_ns(ns: u64) -> u64 {
>     }
>
>     pub const fn period_from_hz(hz: u64) -> u64 {
>-        if hz =3D=3D 0 {
>-            0
>-        } else {
>-            Self::PERIOD_1SEC / hz
>+        match Self::PERIOD_1SEC.checked_div(hz) {
>+            Some(value) =3D> value,
>+            None =3D> 0,
>         }
>     }
>
>     pub const fn period_to_hz(period: u64) -> u64 {
>-        if period =3D=3D 0 {
>-            0
>-        } else {
>-            Self::PERIOD_1SEC / period
>+        match Self::PERIOD_1SEC.checked_div(period) {
>+            Some(value) =3D> value,
>+            None =3D> 0,

This looks like unwrap_or_default:

https://play.rust-lang.org/?version=3Dstable&mode=3Ddebug&edition=3D2024&co=
de=3Dfn%20main()%20%7B%0A%20%20let%20asdf%20%3D%20100u64%3B%0A%0A%20%20prin=
tln!(%22%7B%3A%23%3F%7D%22%2C%20asdf.checked_div(5).unwrap_or_default())%3B=
%0A%20%20println!(%22%7B%3A%23%3F%7D%22%2C%20asdf.checked_div(0).unwrap_or_=
default())%3B%0A%7D%0A

in case you want to make it shorter O:-)

>         }
>     }
>
>--=20
>2.53.0
>
>

--9Ib26oYEF+J5DSKt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEiXAnXDYdKAaCyvS1CB/CnyQXht0FAmmexbQbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEAgfwp8kF4bd254P+gPYUqzDhLphSojcYc1Z
nSZIjJYQUXdPvQnolP/ydFnfW+IMzCX9M2BD346x6nsqPyWb2zvULVpx8OOPnIG2
yTj9CHQBXrLXCdVBzPhbJuogpS8YL1s4MPF3XLxxPdkLH+tuxAwSWWniF6bV41yi
sPC1ohnXw9YqVKBj7J0stZRbtupoH6l+L/gENCIQUwuRl4BPmCCLEMdIbx06in3Y
K7cqO/J5J1CeGoaTRQhY1vyc0YizxiI5wzoKHUR4hZTPZIDt7WYIjEOswwkUZarw
TwyczuH4lwqls1hyM6/oxea/+CrYkFU2qPLA3I6scjWu93RqX6qgrpgNqUZtlojv
z1sE4relQVzmm5OJXPDMAHFtDKg8GgvwGy6ncAOHnjYgB84r/hdXNm5TF/eCEQVc
zJDGe6wF2o5qnD6wrFBUWVFs4qAbxEXhIMSxQdNWGDpu20M8h8MYwWyXSv6XzeNT
6fupBwSmszE3kaEK8cHEI6+nOXI2jMNy5hCOi2ErKg7e4Kz8yeVVAhx59TVQ94QA
9Hqdrz7Sedzl4dcV0hAGvqUTPdZaA2r/fos7Qr5z6WbspdLDgp04AwQ9D7cluxyS
akcYRgSWzvfjCsq0ske153/9pyRR0xANwQKBprSnUpvpeOfwjL41yaQObWEkMvlj
u0qkK2o14zJDXiCmjIg1ROj7
=YJWd
-----END PGP SIGNATURE-----

--9Ib26oYEF+J5DSKt--


