Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BB4F0181A
	for <qemu-rust@archiver.kernel.org>; Fri,  6 Mar 2026 09:50:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vyRok-0002KQ-9u; Fri, 06 Mar 2026 04:49:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyRoi-0002Jp-NZ
 for qemu-rust@nongnu.org; Fri, 06 Mar 2026 04:49:56 -0500
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyRoh-0004wb-6u
 for qemu-rust@nongnu.org; Fri, 06 Mar 2026 04:49:56 -0500
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-64ca6595c8aso8804681d50.0
 for <qemu-rust@nongnu.org>; Fri, 06 Mar 2026 01:49:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772790594; cv=none;
 d=google.com; s=arc-20240605;
 b=lJ9VkEuGpVi0tT+O2jxMNvtmhkYRABIyPJ9V9zbaOmNo75MIC7+PWCF+uowss+Z5HD
 /7n3n214p2PqPu45v4kYKUc4lHWqUZzbwUjzmbG1QcwufIIFIiOT7uAerDRe5Telvm6f
 qwaUXGZzRR6rJcFVB6hiJ6uxczHSYPMxJSnGIVJQ1f5mND1Wnm0aSm519GNt69m9kes0
 7wQKTSQKwqZCa7EVVWp3xWr9HYik1nJn7P3i6D+kpI9B2c6s+2p1hA5hegBb+2EANuUi
 zUZ6YbUw0MlX5LqtjWHV5WkLoGp+C+81L1FyqbPAwpbmStYR2RZClzWKhWO9X1SrDyQA
 gR0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=gUn1nqn3wclmJWxblTsaUHjjS0ijVhXE2LYsDu60P1U=;
 fh=mWNiimXstvwH2eaYHGEYwiMVVcAURhwR8rb6vXF4Uv4=;
 b=REc4wBCx4TvLjCm5kyCc2TxOLsnzHNUPAx1BPWlJJpsYmtyvDINZ5Qh2/Yb/EGOoOH
 jWBfU12E/j9Xw2YcDsFM2Xi+79o24PLGqcF80VAvGnDATYkxW4FbUqyPTNhLYoFB+Bxa
 Kdol9jzbDIUA21KNLu8sUixa8w3lL2JvVjEh6GwLN67JOeMD0qq8aDoc7VNeDbPaz13i
 eR64SqijqFvjwfearXg07mLWO/wu+qqTWWWa8GWHyHAGTkkYNDfVW7V9MDUQBjiRkxyy
 H6hk24dkWX5Jbqt1tdkHsu/eiTqdYPZ4gqCLpIleKyiSdGROYsZB4Cpw/gBFJzNcUZRf
 7KSA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772790594; x=1773395394; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gUn1nqn3wclmJWxblTsaUHjjS0ijVhXE2LYsDu60P1U=;
 b=ngzeTCmh2768q+IH2+2o/3ksmYqkbwJJpO6EMg5pCdvHCF1I3ucmbfcT+XD4i7MWIO
 a1s9jQ3TLgxmnJdrmFtlKHIyJlDjC62ix16brLhyIwA6MnF/D4THW0gLfMwrn0Ay5U5B
 kDtwje/W8tCwQqyokbDyhJpxJpOPyNi1lnEwvtfLdGD4sNkzkuqm5a/MbTn9t1YnjP/J
 aKZfEHCG6rUrd/cDiyDcHiF8BXe08XdpRvNzPBmCQ+ckDoK7ZfGbjmi9GnFREQ6GM8qx
 0gEOkRwbqa/H4ScOzW43M48aTTnXDdlLxq6LXhuxLZ0T9T9GQNsR7uw+4q+2JYCxFQ6k
 IJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772790594; x=1773395394;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gUn1nqn3wclmJWxblTsaUHjjS0ijVhXE2LYsDu60P1U=;
 b=A6K6n3m2M9Ld2zRwnjbsX5CK4NrHqNZJ1bQ01n9GNjo59dEL22gtWhJ/tk6o9J7RNN
 2QBLOQLfaXIpTJOu57nYgrT2lQg6Tj1asv73hBF6d3hNtYSSqTjGnfyz1cv2XEdYBKmg
 BlBULO5S1FuDlOZ6v+cJmUnCeN3n2PewEMsMep7zgxFSKFtCmlOc4io5ah7BUZBJSYUe
 hLzOpRMVn+fDXTSTqIljrutDr0ITfjdjzmbcNaoStQxkWMxnIR7ZqQCWriFeee8VhLfi
 iv0x320hKjo/vgSpVuQhNQ8yZsC6+7Sej50lZXbRKZ+3fOSBVKpMFfgXenFKJy+ZovsM
 6/OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWTk2kaXBKX0qPVuvx16XO2msqrZcoJMWD441AyoybxU7xlEQXvnfZFJ5tJRKbWccTUEwTFfpKjC4=@nongnu.org
X-Gm-Message-State: AOJu0YxIy63sPZm2lBu+3fcIy+NaasyM+a2eTSFK9E/DfQaZ9Z4rJPhW
 knFiLP3aLxcSZySCwFrCuBAEwohcs5XSYFUKKg4dQmPqZzVjv7yzIhZYgptaRptGmBxkNW7CIL8
 NUtmaspiOymBfGw9LTPOxs30T/XXCW6kCvs3Lt+8lQg==
X-Gm-Gg: ATEYQzwwWu7ykBrK6xWX5P+vwOkNaT5nSzgIlVldMvDEhaAtRYJB598puKjfkIDnYxk
 Nye2bUaZcCBWaOVmE33I6yOz/sXWd7HcebjL5ypVb4uV9FuJhKKGdLGU9SM+4dH6Sf2aW6Dd/EK
 ZZoXjITpH+ey8vGNmHv4TtEbp6Jzq27ZCmrcg7SLeYcmzNEyh7mbYFQvtVScf4JJiWE0mwRd/d/
 R6N0UF4uH6vulibdPxtPsrzeAEHxKXguaaAvDGlrx19MbA6A515nXyWm4sHaTy0goOAYWsc3+bI
 cNuxmfc1qvnVbZmudgCEhV6PanKr6SXsA3EUaL/ObBZ68YZzBI3SwQnK8gpT67DSfUE=
X-Received: by 2002:a53:ee57:0:b0:64c:f4fa:4030 with SMTP id
 956f58d0204a3-64d14147f3emr1183053d50.25.1772790593989; Fri, 06 Mar 2026
 01:49:53 -0800 (PST)
MIME-Version: 1.0
References: <20260305174743.3084606-1-berrange@redhat.com>
In-Reply-To: <20260305174743.3084606-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Mar 2026 09:49:41 +0000
X-Gm-Features: AaiRm53944RP3nbQCH4yDEJiFWk2oBVqmQ4IdLDYRUArj--z9TMadt_OR9s97v4
Message-ID: <CAFEAcA8yfT_BtdF-oOtW4BJ8h2FSDwgRMdMt_HJc1g6XUjaC3g@mail.gmail.com>
Subject: Re: [PULL v2 00/27] Misc patches queue
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 devel@lists.libvirt.org, qemu-rust@nongnu.org, 
 "Dr. David Alan Gilbert" <dave@treblig.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 5 Mar 2026 at 17:48, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> The following changes since commit 3fb456e9a0e9eef6a71d9b49bfff596a0f0046=
e9:
>
>   Merge tag 'pull-request-2026-03-02' of https://gitlab.com/thuth/qemu in=
to staging (2026-03-02 14:01:46 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/berrange/qemu tags/next-pr-pull-request
>
> for you to fetch changes up to ca61f91ef9b0d10333881fd0070303ea33cbc72e:
>
>   util/oslib-posix: increase memprealloc thread count to 32 (2026-03-05 1=
7:40:24 +0000)
>
> ----------------------------------------------------------------
> * Increase pre-alloc max thread count to 32
> * Fix checkpatch warning for new/removed files with --terse
> * Detect more GPL boilerplate in checkpatch
> * Fix lean of data in TLS/websock GSource cancellation
> * Tweak CPU docs for DiamondRapids
> * Unconditionally enable thread naming
> * Fix race setting thread naming on Win32
> * Add API docs for logging APIs
> * Fix interleaved error/trace output
> * Fix missing error prefixes with warn_report
> * Add detailed error reporting for VNC passworrd changes
> * Refactoring of error_vprintf & related funcs
>
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/11.0
for any user-visible changes.

-- PMM

