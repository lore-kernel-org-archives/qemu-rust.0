Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85B6D3B7F8
	for <qemu-rust@archiver.kernel.org>; Tue,  9 Dec 2025 07:34:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vSsFG-0006a5-Bs; Tue, 09 Dec 2025 02:34:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vSsFF-0006Zm-AF
 for qemu-rust@nongnu.org; Tue, 09 Dec 2025 02:34:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vSsFD-0008DW-Rr
 for qemu-rust@nongnu.org; Tue, 09 Dec 2025 02:34:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765265685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=C5aoeHZzE8cOjDaOVoqUqpDfog/AM/oPRtRdNyWR2M8=;
 b=Fho9nSmCceswFumpKpvbmmVR0iU+QPspArWll/F/DFoohrkTfVQrJXzoSRSedVVnL73/PJ
 Zy718gzy8clNhBxb2lerNTpoNi08PKISvfFCD2ETdeFeMC8sC7Dab7Zkj5n5y7bP2crEGd
 M73vq9FchLv85M4s6qB0b6VxCntNgzo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-S8TYdn0XMJycwDBw4mZl6Q-1; Tue, 09 Dec 2025 02:34:42 -0500
X-MC-Unique: S8TYdn0XMJycwDBw4mZl6Q-1
X-Mimecast-MFC-AGG-ID: S8TYdn0XMJycwDBw4mZl6Q_1765265681
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-42b487cda00so3010505f8f.3
 for <qemu-rust@nongnu.org>; Mon, 08 Dec 2025 23:34:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765265681; x=1765870481;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C5aoeHZzE8cOjDaOVoqUqpDfog/AM/oPRtRdNyWR2M8=;
 b=g4cq9RwQ/BiipqABsAp6ZlzLzoRY17d7Kl+iR4JOujZNlpYZ91JaEem3aljrIm89YM
 5hlMr1qYLzaYKvlyb/qoGlxlHcRWo9dtvYB7bQRmlq9gDJdIAVmyLS4YqLQFDlbCqHZ0
 jJbluNxc0HUgEax+WKzP0X8q8XFM3dWNakrKiOQfWCfEknas5Ep3IZympfNUIk/kLZGf
 AbVJSim/B4gwsrx7NQDE8NdCcMqo4F2D7X5V7k/nG57Ku5FiikDblhirJtu3v4OreW/J
 yNnWbb8xw53D/kLCSaXs3MITUhdeKFKL+ejBD6DQqZ2fZcupe4cWdSld3bV4bpeJ5UAr
 YRTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8aLxwNCCDCh8Jw0WH/sQ/Tytd4pJ3doYLljlxJOHPoASkXbqtQjlbfGMFdYK+34RYRtA8p6FGEV8=@nongnu.org
X-Gm-Message-State: AOJu0YyMZ9GO5qr8ds+MkJvv9AfDOBkAHOnHaFPSX0caVQSAkisDiijR
 Z8iTgQrFh2LDURb4YCb4urMBdyqA3jIzz8qVDHpx/ffDl5cg0lurEi54lACbctzRHv00zcVIwLU
 PWv7J1cmDi1OK4sazVxBaEaugyy/cOJpX9vA2ccbs64/lmwPKRD/789A=
X-Gm-Gg: ASbGncs/S/X4mp3XrZPgLgYETdKLnGjwCXf7rnoiD6SurqLIP0Od/KLzB2M7Os2Gdu8
 NENBs9U1JYQI+WQ9sEmRpSBDEBqzxLB4uL+VCeW9Lwp8X3cSx4ufbopAXD5nIJpVBGbfU/4MfQw
 1Us7LGgXl/KGYGJLbwNjfxyTXmCtMmB0h1WQb7jkHzUNudHbKmIVi5g3l41c+Tk0HzySxab7PXC
 7feurGw++8g+j7t/QMtoYOSn9ma5Y47rF9G54jLBxhDv1SlU58R+gbFwiCak/vj6mBETJAgKp6N
 A4pXbIhuYC9P8fAk00VpfI1UA7F7XlLmXZpSkPtlv9u59XqDjNL0cNaCYzVOwEKZkOFtxTW+FbG
 PqkaMBfmhAHxx+UySrCRjXNWIwaX/MbDoLbYxWK7crHfKKg2hAWtBjxlf5Ae1BtmilTnFM2ibwp
 6jg8vW+wis6w0X99M=
X-Received: by 2002:a05:6000:200d:b0:42b:3cd2:e9b3 with SMTP id
 ffacd0b85a97d-42f89f487dbmr10199243f8f.33.1765265681007; 
 Mon, 08 Dec 2025 23:34:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFb/4fh6wnpvs2AxRo0vV3tCPXBME7ifZlwSb21XbiREDcU1vtKAhoVWNjsaL9v1pX+t4P2ZA==
X-Received: by 2002:a05:6000:200d:b0:42b:3cd2:e9b3 with SMTP id
 ffacd0b85a97d-42f89f487dbmr10199218f8f.33.1765265680638; 
 Mon, 08 Dec 2025 23:34:40 -0800 (PST)
Received: from [192.168.10.81] ([151.95.145.106])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-42f7d2226d0sm30082964f8f.21.2025.12.08.23.34.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 23:34:39 -0800 (PST)
Message-ID: <98c57c07-29d8-44e0-8b69-a4625a954ffc@redhat.com>
Date: Tue, 9 Dec 2025 08:34:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/19] rust/qobject: add from/to JSON bindings for QObject
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 "open list:Rust-related patc..." <qemu-rust@nongnu.org>
References: <20251010151006.791038-1-pbonzini@redhat.com>
 <20251010151006.791038-12-pbonzini@redhat.com> <875xal5jnv.fsf@pond.sub.org>
 <21a2d5fb-0181-4ce8-8bea-a214c8eac2d7@redhat.com>
 <87cy4t3yzc.fsf@pond.sub.org>
 <CABgObfYJiBZC6jx9wQGCubC8J6Gu0Hn9q+Zo_Dm1J8PcRJDNNw@mail.gmail.com>
 <87bjk9fi2n.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <87bjk9fi2n.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sUlbeP2t57Jz1lMyHF-D6mtBYuLgNE8c1Ho_fZwHaTU_1765265681
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/8/25 10:17, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> Il ven 5 dic 2025, 13:16 Markus Armbruster <armbru@redhat.com> ha scritto:
>>
>>>> Note however that there is no support for push parsing, therefore this
>>>> would not replace the balanced-parentheses machinery in
>>>> qobject/json-streamer.c, and therefore QMP would still need a minimal
>>>> lexer.
>>>
>>> That push parser...  I never liked it.  First, it's half-assed: it's a
>>> push lexer wed to a pull parser with parenthesis counting.  Second, why
>>> complicated & half-assed when you can do simple & quarter-assed instead?
>>> We could've required "exactly one complete JSON value per line", or some
>>> expression separator such as an empty line.
>>
>> Hmm not sure I agree, actually I think I disagree. It seems simpler but it
>> is also different.
> 
> Management applications would be just fine with the different interface.
> 
> Human users would be better off.  As is, a missing right parenthesis is
> met with silence.  You can then input whatever you want, and get more
> silence until you somehow close the last parenthesis.  Quite confusing
> unless you already know.
Not being able to add line breaks to a long JSON command (preparing it 
in an editor and pasting it into either a "-qmp stdio" terminal or 
socat/nc) would be a dealbreaker for me.

JSON says whitespace is irrelevant.  "This standard format but..." is a 
bad idea that requires extraordinary justification.  Not that it matters 
now 15 years down the line. :)

Paolo


