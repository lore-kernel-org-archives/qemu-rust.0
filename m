Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896BB606A323
	for <qemu-rust@archiver.kernel.org>; Sat, 14 Nov 2026 10:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vpUWzyTn
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1xSBGT-0006aA-Bz; Sat, 14 Nov 2026 05:45:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xSBGP-0006Zk-Tt
 for qemu-rust@nongnu.org; Sat, 14 Nov 2026 05:45:44 -0500
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xSBGO-0007sA-7Z
 for qemu-rust@nongnu.org; Sat, 14 Nov 2026 05:45:41 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-8b0ca1ebc8bso21928447b3.2
 for <qemu-rust@nongnu.org>; Sat, 14 Nov 2026 02:45:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794653139; cv=none;
 d=google.com; s=arc-20260327;
 b=OZE6gKgQJ7LyD1V5gsV9cehA/enSLl1eBd49UypcSezUU/LIyHDdCvjydSKA4kdvYz
 QmUS5ZqMLf/tFkN8zNIxG1chmznaisLHdyq3V1GWQDslb2TTJiVheH7hzf57T+Op28NG
 h4V0WTpLAJK7TtpcyD6S2itJHThze//VfPSERafoDFkNQB5aqRvdH4y941rVrqlbhmBG
 ibu3POyvrQBoPnXaNVBgPrHrgz2OFOfBGNden/H6thqG7SSDrRwKRRiqrnaCAfaa5g/h
 E8Xv1UzL9Dgmgq7EpXZLP6yEpNidu/9evmo/7y3ipte77XOpT7oF+H6qJci1OV8PhXob
 CTCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=mQhgN+bEJ/PhZv1zLU1AK+NRBSksnItZvWKkrjNq77c=;
 fh=vOPZxaqgAbe8kQZbXmpoDDTB3Zyu3B9ovU0iQFHXIuE=;
 b=pWx+z06BHnkQLBKztd2I1aRgSlk1ZSvWLK1/OLWs0vI6OpJUigEf/HitVOF+SIQfzC
 IZiAH1NyVjAJyErLLsXzhMHemgvHneQ5WqZC/LJhWwaAqFh8oVo6tGmbB6zPLa4rEmlc
 AbMzM6JuBz8mcEbPU6Aen41ZortY0cq1MhY1e5pPLfdGWGz+Wfnc9MwXc+MFQxkuRd9X
 qkmScbfqkad7qo+RdpAHdnzBjvb43Amq+2gEE8YX/acYITuXgGSit178oILMEbYx/1M3
 rbHNoqzou+C3MCt4/iJYIm7EEGrSZnPpfgWHjp1kJo4vigyW2UYVh1kH6S+BKj6WTJUM
 F48g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794653139; x=1795257939; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=mQhgN+bEJ/PhZv1zLU1AK+NRBSksnItZvWKkrjNq77c=;
 b=vpUWzyTnqNG3rovI/0pQndI1ZwY2KP9rX01xTcJm9gLLpzLbzr6lpOCu7M3RvvolwW
 fP6nqsSVhT47TC07fxeBNGbiqMhhwLHlj+JwWyiyNpxag/j6QP/Hrv2/7AcWeBZi0gK8
 dh/UTMOYl814gwrCmKr2TMKJDkGCQM+B8HEuDjiedX7pmEK9+r0OO+bxx5SgrAkiG6MV
 ChwsxnAM9cQelsvqG89hlXYWzDWWlYeuh3rHj886ytyTECZsxsrK4WFE86NA91joF5O1
 OYyLq8m8A4XssLIesj6e1P1tXkhIpF49HC3xmK2+xr5ZKkXXUGYqkCgzuA5ybIVq6qW/
 jiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794653139; x=1795257939;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=mQhgN+bEJ/PhZv1zLU1AK+NRBSksnItZvWKkrjNq77c=;
 b=b/fhgruQmduFtKUXgq7hnlWW7jfFYKVafa2yRNC/SRBTtFp+5LF49/P646OQ/N3mYz
 quEnvaD9UI5Hkm00qE5VAtX+azoftImhbd2xZQ4XejUvZ9paOdH9vrTWELr31ScK4A9m
 Hmo/VXkglarJEgV5mFoo3wyrDvpyn5/JWM20xbAV6eBihZaFc5xBLAtdIk/rPOITL56h
 nBiUnyJXQ/5gKwJlpOrQIigu9BgJHDT4uAFBq3WqBNMxzj/XHi6eRO49objMmzgMK+2H
 qbmmKdb8UBeqha/KpPBbyhz15xpCBu+3gkQh6DWS0uEjx3C6tfBbI48l3zKRZmU7B6Ef
 ZUEQ==
X-Forwarded-Encrypted: i=1;
 AL+hErHAa0R8DytUXWKGK/aIaxeSNxsbOo2gHKTw/iDvT6rHOnSpCgCei/eGCrSxpytz940iEz5mAATeUTQ=@nongnu.org
X-Gm-Message-State: APuU4Z/n2xzjmvFXsY5xZyfAOk27MVZKCm4eWDwnKEMrBU8YbVl2X3PI
 u7E1JYq/N/czAXqr5bqlR4CkxLbpLek3iWjZ2wCpbo2xSSPgb0HumZ0cMXA5a91U12lDHXbqruh
 M/xhmjTMyolSZYV8PehuoYOBqg+4avu4TO/2/sncwlA==
X-Gm-Gg: AYBFou1l2nf28OwdblpMj9CwOMzUiKb5uYpXYHg55TAPlZ8JJvHga3zySSBlmKnWG5h
 XUFehQicsvGg67JktATLsKXZs+Bzse/cqyfwTmh2OmpxWQVEMFVUcVe3N9pbQki6C7ZBZ1HSjOE
 qfXxAhm4lDvquTAYbomEDKOVU8Zi2k0derMtoB6rmptf27L5N6w/kwC61t/oXlCbu7ldDgc+CMf
 pAhKeNbNgGvBes31vstQr/TWDA4++oCXcKBDlM3pcQBmHrzgRi7zY7RHtTOxDuGbUoOt9inGOxQ
 9lNopPf6wJd5gu+U5p8gbfAFRO5FaMt3LGpKiVY7WuQPFGzItyVGJOtoi8Ozpm2QEV0Y/KxnBNP
 5hGeetdxKUQy9jI+wBmmGGe2qTJ27e04vBgyUhfsfwolJBNifcX2fhp/l6M1QRAkXak4kW8onkb
 gD23IDPWb/38vpTKkjiTmcPS6rhxHi4rpukBApY0mrxw==
X-Received: by 2002:a05:690e:1287:b0:67d:a096:d8b7 with SMTP id
 956f58d0204a3-67da096daffmr547457d50.3.1794653138400; Sat, 14 Nov 2026
 02:45:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114-rust-single-bit-v1-1-da0172820f84@rfc1149.net>
In-Reply-To: <20261114-rust-single-bit-v1-1-da0172820f84@rfc1149.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 14 Nov 2026 10:45:26 +0000
X-Gm-Features: AclHuK845J52encpOGbgsrGP27dHbOSjqDEwDDgdmBHKAe9IAWK5eD_KFPv3G84
Message-ID: <CAFEAcA_itbkwQjXUwnmXXvP8doeUGE_uEP16XA4XeL1DWgs1+A@mail.gmail.com>
Subject: Re: [PATCH] rust/common: rename IntegerExt::bit() to single_bit()
To: Samuel Tardieu <sam@rfc1149.net>
Cc: qemu-devel@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 14 Nov 2026 at 10:02, Samuel Tardieu <sam@rfc1149.net> wrote:
>
> An experimental Rust nightly feature `get_set_bit` introduces a `bit()`
> method on integer types which checks whether a specific bit is set. This
> clashes with QEMU's `IntegerExt::bit()` associated function which
> returns an integer with one particular bit set.
>
> While the `get_set_bit` feature has no planned stabilization date yet,
> this is reported as a `unstable_name_collisions` warning when compiling
> with the `strict_rust_lints` option, and warnings are turned into errors.
> Renaming `IntegerExt::bit()` to `IntegerExt::single_bit()` prevents this.
>
> Signed-off-by: Samuel Tardieu <sam@rfc1149.net>

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4842

thanks
-- PMM

