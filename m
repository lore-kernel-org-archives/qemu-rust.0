Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2914FD3779
	for <qemu-rust@archiver.kernel.org>; Wed, 25 Feb 2026 17:44:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vvIvb-0000iZ-IG; Wed, 25 Feb 2026 12:44:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvIvY-0000hr-8D
 for qemu-rust@nongnu.org; Wed, 25 Feb 2026 12:44:00 -0500
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvIvW-00056z-2x
 for qemu-rust@nongnu.org; Wed, 25 Feb 2026 12:43:59 -0500
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-64cb577e79cso201224d50.0
 for <qemu-rust@nongnu.org>; Wed, 25 Feb 2026 09:43:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772041437; cv=none;
 d=google.com; s=arc-20240605;
 b=jJl90PA+ZLzvTOSWx2Qi8ixykJ/IaNYzPT5YqPpo6+Km4ojSVQCVbsI7Q8TT9c8qyi
 58wz6xoXfs7Fsl9/y2NkMVXVtR96g9qhiPjRMEAhIAJrsxBE08Rxdh21KlRQKZ8VMD45
 s8NspXuMp7TSbCuVGtEUhiit5u4DJ6+Bod1LMvG8qcOdykjLuO/NgJAo1KE5+feDq8L/
 msWPb+zt8JCqGpVYr07DwG8a+OIwHZVAJc1KBlTc/rd+Ngv7ZYytdLuprWXErlE/wss8
 wlvGl9ODF4LqWxLkvbk1RsG5nk0BaoPK86Gz4URmWmd6VEN4JMQsXSuo1lifg+8l6lLh
 Q/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5c9lLHsvBwzYZYUkReN6JIA4gRPe+xJCWEDelO7ofkI=;
 fh=PHyypoVQEc2jtIzaQB+rNJm32QOc9sBC1e9s4KRkBug=;
 b=Vf4itSov5rjDysI1pnUfpnFKqtPg8Cny8DJoFaoR+VMgHmpngjOcqBqo94/HFIwHkI
 AVLsmnm1VgFPN6BopvGZ7rfpGCBmLr9WIy7ng/tItawZkeatBReGKuVCqAmNPYuWj8V4
 4zY7Kii3rXz2wNFm963SFOvEZ+rp1cwr72UQ0jDzx6XQdWarepPbW3qGVFZxzVqfbrjW
 0PxkryH2TNNJsmaz3uvut8vd4T2v4CR3zj07cAxejp+jrgkek0RTZI8w6dmJjStGK/Rd
 R81lRu1pVWR3MIDEPIBSsEQ2J6t6FYgmOX/YwdsM6r3i6Uc7OE41N4QkHLOMC4wn3rXP
 i/mg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772041437; x=1772646237; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5c9lLHsvBwzYZYUkReN6JIA4gRPe+xJCWEDelO7ofkI=;
 b=ja5+HRDKkXXQLoLDmSwx1o1j8qowck53kdLyu8Ub7K+d+XvXQUlmRjJz5tL/Zmj7Te
 XwsmNyQ9/8FbhSG54q0ExA7iLH9it6WvgRYOAM31JLHeuJj3gyR8w7/uXwginyp1xRrF
 MmFI9pLbta1eGlkc8punicC5Su8aJuXB+CD1XRDniq+EoXyJYjgFrBSl8fkc7qs2HGAI
 cXDCl6R0nuV0hlErUUz+kQm2HGT3vemR5/VGwcZM7UGcrPWu0RdmwAUoZ/UnpvVDrQI/
 65kuOh4CcYYymDwbwJgopLXV1Q7SNW+qnZfM/EHJ425lcNvrsZnIijUeR1XbrOO++2b4
 twpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772041437; x=1772646237;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5c9lLHsvBwzYZYUkReN6JIA4gRPe+xJCWEDelO7ofkI=;
 b=ClrRvEs9XLbgpDd1bcBbcJKq2oMSASkGFv6hUq5c7WpGs5+Hl0/YAwgQv8BvVFijbJ
 MB/F06kcjdyVkyzg87urBq8+jz0IFxq7aKakIyKwnyZExheFGp+6JpY7Tle9whMmelK8
 hjrAK5+CJvhsMVDLey35gLtAe+Xit9b6AQTwpx6HAaLI55M4c6yhsjPSAxdCzQBgh3yX
 8RPJXB/qy7Bq6iKH4NwSYms+JejgNimkAW9rAVUZbXpgsWmi9eKgS+0OIJbXmZtfRaB3
 5Y41K9EJIMyGHSIcriBdxKmwDCyXcUt1C1hZJFg7IEF974X1QNqETqkmnbgfWe0wKvEl
 J3Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVixAB4/mMQt05J5BFtIvvGG8YkFceBETFbkNaYyN2VwJCRlsrkcmifE7jGPbLV3YMkqXsPeyzqLRM=@nongnu.org
X-Gm-Message-State: AOJu0Yzh22lvzx1Ref5s+F4qHQNqze7HhKy1Z+0Ib6X78kKXVYVB6rBC
 HZ/Md/+uY0OAxoSOQQQt9Cfr1mtOvoigT+bHk7ARUeHklUOV0uCfmJa2XXDSv4yitJpZr09ilEt
 D9oTM9n+9T+VHU62QZKSLySo/mnXDV2cjv2+WlRMD0A==
X-Gm-Gg: ATEYQzxxwZUA6+AnRYSHLmjNtEFdjUDNtDbtxgLBbWvDKgHTdSf0Wm6cOtS0l3O+FJW
 ETEY7OzCqpAvL+lZezBg84V8Tu7010UaFfEy6JET+CzRM3Ee/r5D3INcNIMOQQoaDP1ltc5PjPT
 /ax7jDuJjIuq9vrPmbeBNdApGpoRP3ryaDvNR9ZZJCVqTLz3IkdPd0CsYY0CH6QIGiFXgxFtHhS
 tutUBi0M/O+T+DWV4XBQMna6l7IMI8+LhwHgawnesSdvu0XeQ12UveQwLPM/baNcXsbG0GLQAvR
 uSOfbuI7ilLt/veQodQPkmtTHDmnSldvQsf77zHgbOFOa9b9lHgc56uWKehST0N5TBYXHomWKw8
 7DQ==
X-Received: by 2002:a53:bb0d:0:b0:64c:20f7:b018 with SMTP id
 956f58d0204a3-64c78d3fd9amr9854081d50.62.1772041436782; Wed, 25 Feb 2026
 09:43:56 -0800 (PST)
MIME-Version: 1.0
References: <20260211152508.732487-1-berrange@redhat.com>
 <20260211152508.732487-26-berrange@redhat.com>
 <CAFEAcA-6XMp6B-V2X+=25Q7XKwy5JuOpGj9RNpN+mTNxm71wpQ@mail.gmail.com>
 <aZ8lfQ8fqVAYTLAa@redhat.com>
In-Reply-To: <aZ8lfQ8fqVAYTLAa@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 25 Feb 2026 17:43:45 +0000
X-Gm-Features: AaiRm51xgmrcjKgxjgq3Dloq5w3hZ2jhHc7pFBS1iFwF_gOmzb_MJIy57ELM9I4
Message-ID: <CAFEAcA-AgvQESekxEYr_Y85qPzRQAfWvZwbM-WjemEU+tOmBdA@mail.gmail.com>
Subject: Re: [PATCH v6 25/27] util: add support for formatting a program name
 in messages
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, "Dr. David Alan Gilbert" <dave@treblig.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, devel@lists.libvirt.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, 
 qemu-rust@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Wed, 25 Feb 2026 at 16:38, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Thu, Feb 19, 2026 at 10:23:36AM +0000, Peter Maydell wrote:
> > Why do we care about the qemu_log output matching the
> > error-report output? The logs are expected to be
> > quite frequent, to only be there if you've explicitly
> > turned them on, and to be usually directed to a log file.
>
> Personally I never use the log-to-file facility. Instead typical use
> case is relying on the trace points 'log' facility as illustrated in
> the commit message example to dump to stderr for simple debugging,
> and having consistent formatting between the logs & errors is useful
> there.

Do you not find that the tracepoint output is often just too big
to be manageable via stderr? (To take a random example, the last
thing I did with tracepoint logging produced a file 196MB large
for a not very long run of the guest.)

-- PMM

