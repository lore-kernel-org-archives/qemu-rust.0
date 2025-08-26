Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0271CA0FE7
	for <qemu-rust@archiver.kernel.org>; Tue, 26 Aug 2025 17:44:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uqxiQ-00055w-QU; Tue, 26 Aug 2025 13:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uqxiN-00055V-FX
 for qemu-rust@nongnu.org; Tue, 26 Aug 2025 13:44:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uqxiD-0005vz-Eu
 for qemu-rust@nongnu.org; Tue, 26 Aug 2025 13:44:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756230235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3yLTx2j9yFlio4XhU7yRqa14jxVAqA1QxUTHuBOSf1s=;
 b=RoFVCxfsXF2eD4kVJ3VDDoNn3iiCvpw3bkLcfhEWic/dd4Ey+QM2lYhuZLTehf6WYkjVbk
 GQ6iOJJoZPfdrJFMIvMrwYN8akcDaYd300AUHvD7Eo6vNltP1Oz3h36Gt1GezLP1Bm/teM
 ZLjIGNO3TMiJN/JEZM7KMt7CWyDfeTs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-_PX7MF7oNzCxPJuL9Lfl6Q-1; Tue, 26 Aug 2025 13:43:53 -0400
X-MC-Unique: _PX7MF7oNzCxPJuL9Lfl6Q-1
X-Mimecast-MFC-AGG-ID: _PX7MF7oNzCxPJuL9Lfl6Q_1756230233
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45b467f5173so42903525e9.3
 for <qemu-rust@nongnu.org>; Tue, 26 Aug 2025 10:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756230232; x=1756835032;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3yLTx2j9yFlio4XhU7yRqa14jxVAqA1QxUTHuBOSf1s=;
 b=u7JtoUwyBhxlnJKJn4ZM5/Z2+SHM2po4XwFulgF9Rz4T55Z/XNTZ4ZEws8P2LXOu+t
 4VtJa7r+S3AByFPb2thNUC08M9tUQA8tRIGbD9F6MTxOKjEhg2zJ7DDBKZQ7lmhlaAZ+
 aw5Ro2n1+9iOlVXhjpJHD8f474bTNBZzKIBULV6H6fT/AEsuUs2aphmAUi9Y7y054hZ+
 VrbS/E6pGL+yJ+tWjsodJmheSUoR3fHmFs+1z+cCxifqmyOPL/EwlWaP8qpM6W3heGQ4
 CogX5JPCggEMoy3QKWcxMr1p28fgT359nbdM5Ic38llzldTN0bVZ7wMRyxhACLOGaXWG
 LPmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+w/mZxbEFWZkUci7w+GEbOhpzD7qIb4UsqVykmX3AoMOCyGBlF/8JIjrmiH9bxcgHKAadQN0PSgs=@nongnu.org
X-Gm-Message-State: AOJu0Yxhg0YyMlrkBXKRjaBqFNfVE9CVJ8aGF0+9xdggC6/LesNzfzBt
 6SthKOldMyvu5kSv49yqsZTSgcnDdtzNCrVHz68ORrjh9Pzk2qWSTXNYW1IkNoteKRTctuou9g4
 9JIIyfUWzFeXmnTuUZ+YR3cSXT0+aEJx6NOMerO6FkE4mLhy+QZ7eNJU=
X-Gm-Gg: ASbGnctVrjFPp1gT3RbiCMH5j2gGlKhxHv1vOoGEYKmWZ1DXzxx8xjVToQazKRiIKA3
 4VM4CbauUCBK/mbgtozF/yvFiWNPepfhwqCgd818Ew2RI2+bcZ7M/ZaHAoiC5q30A9lQ+NTp75F
 GRewzYLC7rkAmxEjeh3q7GQ6VhpcAlH+TGYzG9mmidE2A1gIlwWszFNnXDb8AA0cp2JPuyASKRH
 A97eThaT5TBnFBSX1jUuNNV4w1h7qKmoS+zhsA2b16r6WAeHR5Ce/hPk8kjEUAqc1riWpidcURi
 nhpnLTZoKAEeU9WkU9k6NL3ZhpRw02EFiNWrK9GNcIdDx6F1r3I6GBxa0owI+CV+qYhSmP3QphH
 rOCSzFo98UoncZRKRkjETacP7
X-Received: by 2002:a05:6000:2304:b0:3cb:285f:8d9c with SMTP id
 ffacd0b85a97d-3cb285f9400mr3004061f8f.48.1756230232496; 
 Tue, 26 Aug 2025 10:43:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWvqXDg44RKqvmfKNET92JryD+WAmnTmhgLb5bued8OgqfNnsPrzHIRMRC83LkDRtnPvjHKQ==
X-Received: by 2002:a05:6000:2304:b0:3cb:285f:8d9c with SMTP id
 ffacd0b85a97d-3cb285f9400mr3004043f8f.48.1756230232073; 
 Tue, 26 Aug 2025 10:43:52 -0700 (PDT)
Received: from [192.168.178.61] ([151.36.40.144])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-45b6c5356a7sm2391855e9.15.2025.08.26.10.43.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 10:43:51 -0700 (PDT)
Message-ID: <5da180f5-1601-4022-925f-cc0669270f5e@redhat.com>
Date: Tue, 26 Aug 2025 19:43:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] rust: run cargo update
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-rust@nongnu.org
References: <20250826133132.4064478-1-marcandre.lureau@redhat.com>
 <20250826133132.4064478-2-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250826133132.4064478-2-marcandre.lureau@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FjtPT7fOzXjRaXYPn7XcA2S_BngL8KirrgIe1ype9No_1756230233
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 8/26/25 15:31, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Usually, rust projects have CI bots to do that and check that nothing
> breaks. We should add this to our TODO list.

You have to adjust the subprojects as well to keep them in sync. :(

I was going to wait until Meson does it for us via cargo subprojects, or 
do it as needed until then; for example I have lying around a patch to 
update proc_macro2 and syn, because some experiments I did needed a 
newer version.

I am applying 
https://lore.kernel.org/qemu-devel/20250717062727.305466-2-pbonzini@redhat.com/ 
and your patch 4.

Paolo


